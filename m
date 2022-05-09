Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95388520AFE
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zH-BE; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nny3U-0006No-1E
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 07:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dk7sKFXvRvCPtCi86GSGNPkEHALnxnEABKBqOJsz3CA=; b=QrReybz9wkBtHeqwZQQTiRGDBG
 /4pUmhSa2V2GBrXkk6rYewl80/TVlYYBb5XajtfluF20ZlHrOEY0Be1TVg8kDeT8ZMmX8wkHsTxa4
 WmKz/FrUkImjGDc27xdhnXgW203//OoIO7B0Hx8lMAgeVbAyQqpj0P7XGhYAYCuWBbLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dk7sKFXvRvCPtCi86GSGNPkEHALnxnEABKBqOJsz3CA=; b=OP44PZKKjU2DRfcTlkvahE7soz
 9XiaOuWDjk+0y9AQ1Tk1+4EfWhgauGRH3ATrE6emToh5BxtR5cnBBQvCKsvcSkmecfnXEzM//Ny9n
 6bsMkAWvIreLEj0WC9Zj9jkPkYrITxRQP/KMv7kTkhmafl7d//+KXDUSyXjwNK5eCfyI=;
Received: from mail-vs1-f52.google.com ([209.85.217.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nny3Q-0007Wi-Or
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 07:43:42 +0000
Received: by mail-vs1-f52.google.com with SMTP id w124so13025395vsb.8
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 09 May 2022 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dk7sKFXvRvCPtCi86GSGNPkEHALnxnEABKBqOJsz3CA=;
 b=GxQ3LVUqIIhBDJhsYtG0XneCDL+FHU0V1LsABIqfa7hDBPiwPaCGImGWJkdq5aWNFu
 MSIgH3pMD4pYyT5SaosuoOivJMxNYhmRFxP2Vv2PtxRKQvkIHEp7Yoz5J4F8hJnROzij
 6WmIfwbUoinOP8s16IGBs1tb86XaRLae7mhK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dk7sKFXvRvCPtCi86GSGNPkEHALnxnEABKBqOJsz3CA=;
 b=64g5m0rHsG2X32+f9ptHXuxM0QEDPIik12/ffhPScFTZw1dt6pKP332hp0MHJjzals
 0U8n7zhPS9SS5rDI8TuBFZDGe8HqBzRX2ltW+ry9uwnjaXIWbeczxsHL/YPksh6E9vWG
 WwAN4IUpzg7mPyq/9npA4hODz702COPeq2Iexhz8D5b+U/A8CtMliHzHFvCIvRBc55UA
 5KKSHMpxwqctb+jdEmsaRMBh+3dz5FHofEcpgdA/CvvAGjhSwb9mnh6IammOJXpnE1n+
 F8LE3yPgemCAnY2kOWGNdnns8nzjD8kr0+3NyoEaIoKW3e576ZHuX29cS2eWiwRprqDE
 FS7Q==
X-Gm-Message-State: AOAM530svVBI0rDUXYleVhkcaJ57w5xy2FqsMGqhAD5IM2txK3NziHII
 sHzu3lQjdElgGNVMJQTeNEaalDIeCvw/Ex+OMbxnjsWeyKk=
X-Google-Smtp-Source: ABdhPJzRojScfHD/k/uAwX6yXdqsJuT0Z8C8A9YxUmZp6STuF6ZmayLKcuLBPVAmEJcKQuY93EOvWP/oCeWQHGa0Zsw=
X-Received: by 2002:ac5:c856:0:b0:34e:d0b4:7a10 with SMTP id
 g22-20020ac5c856000000b0034ed0b47a10mr7774858vkm.39.1652080278805; Mon, 09
 May 2022 00:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
In-Reply-To: <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 9 May 2022 15:10:52 +0800
Message-ID: <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Content-Type: multipart/mixed; boundary="00000000000028ce5805de8eea57"
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 9,
 2022 at 3:05 PM Hsin-Yi Wang <hsinyi@chromium.org>
 wrote: > > On Mon, May 9, 2022 at 12:45 AM Matthew Wilcox <willy@infradead.org>
 wrote: > > > > On Sun, May 08, 2022 at 02:46:40PM +000 [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.52 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nny3Q-0007Wi-Or
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "Song,
 Xiongwei" <Xiongwei.Song@windriver.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

--00000000000028ce5805de8eea57
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 3:05 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, May 9, 2022 at 12:45 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Sun, May 08, 2022 at 02:46:40PM +0000, Song, Xiongwei wrote:
> > > I am facing a performance regression on squashfs.  There are many squashfs
> > > partitions on our board. I am doing the operations below on 90 squashfs
> > > partitions:
> >
> > Hi Xiongwei.  Thanks for the report.  Hsin-Ye and I have been working on
> > this problem off-list.  Hsin-Ye, could you send the latest version?
>
> Hi Matthew,
>
> This is the patch of the latest version. Since it's just being
> reviewed halfway done, I posted the patch here, or should I send it to
> the list directly?
>
The indent seems broken when I pasted it here. Resend in the attachment.

> Thanks
>
> From 03558dcaab93ed3c32498eb70c7f2b1382b218d6 Mon Sep 17 00:00:00 2001
> From: Hsin-Yi Wang <hsinyi@chromium.org>
> Date: Sun, 10 Oct 2021 21:22:25 +0800
> Subject: [PATCH] squashfs: implement readahead
>
> Implement readahead callback for squashfs. It will read datablocks
> which cover pages in readahead request. For a few cases it will
> not mark page as uptodate, including:
> - file end is 0.
> - current batch of pages isn't in the same datablock or not enough in a
>   datablock.
> Otherwise pages will be marked as uptodate. The unhandled pages will be
> updated by readpage later.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  fs/squashfs/file.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index 89d492916dea..20ec48cf97c5 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -39,6 +39,7 @@
>  #include "squashfs_fs_sb.h"
>  #include "squashfs_fs_i.h"
>  #include "squashfs.h"
> +#include "page_actor.h"
>
>  /*
>   * Locate cache slot in range [offset, index] for specified inode.  If
> @@ -494,7 +495,76 @@ static int squashfs_readpage(struct file *file,
> struct page *page)
>   return 0;
>  }
>
> +static void squashfs_readahead(struct readahead_control *ractl)
> +{
> + struct inode *inode = ractl->mapping->host;
> + struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> + size_t mask = (1UL << msblk->block_log) - 1;
> + size_t shift = msblk->block_log - PAGE_SHIFT;
> + loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
> + loff_t start = readahead_pos(ractl) &~ mask;
> + size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> + struct squashfs_page_actor *actor;
> + unsigned int nr_pages = 0;
> + struct page **pages;
> + u64 block = 0;
> + int bsize, res, i, index;
> + int file_end = i_size_read(inode) >> msblk->block_log;
> + int max_pages = 1UL << shift;
> +
> + readahead_expand(ractl, start, (len | mask) + 1);
> +
> + if (readahead_pos(ractl) + readahead_length(ractl) < req_end)
> + return;
> +
> + nr_pages = readahead_count(ractl);
> + pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
> + if (!pages)
> + return;
> +
> + actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
> + if (!actor)
> + goto out;
> +
> + for (;;) {
> + nr_pages = __readahead_batch(ractl, pages, max_pages);
> + if (!nr_pages)
> + break;
> +
> + if (readahead_pos(ractl) >= i_size_read(inode) ||
> +     file_end == 0 || nr_pages < max_pages)
> + goto skip_pages;
> +
> + index = pages[0]->index >> shift;
> + bsize = read_blocklist(inode, index, &block);
> + res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
> + actor);
> +
> + if (res >=0 && (pages[nr_pages - 1]->index >> shift) == index)
> + for (i = 0; i < nr_pages; i++)
> + SetPageUptodate(pages[i]);
> +
> + for (i = 0; i < nr_pages; i++) {
> + unlock_page(pages[i]);
> + put_page(pages[i]);
> + }
> + }
> +
> + kfree(actor);
> + return;
> +
> +skip_pages:
> + for (i = 0; i < nr_pages; i++) {
> + unlock_page(pages[i]);
> + put_page(pages[i]);
> + }
> +
> + kfree(actor);
> +out:
> + kfree(pages);
> +}
>
>  const struct address_space_operations squashfs_aops = {
> - .readpage = squashfs_readpage
> + .readpage = squashfs_readpage,
> + .readahead = squashfs_readahead
>  };
> --
> 2.31.0

--00000000000028ce5805de8eea57
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-WIP-squashfs-implement-readahead.patch"
Content-Disposition: attachment; 
	filename="0001-WIP-squashfs-implement-readahead.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l2ydx4k50>
X-Attachment-Id: f_l2ydx4k50

RnJvbSAwMzU1OGRjYWFiOTNlZDNjMzI0OThlYjcwYzdmMmIxMzgyYjIxOGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+CkRh
dGU6IFN1biwgMTAgT2N0IDIwMjEgMjE6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBzcXVh
c2hmczogaW1wbGVtZW50IHJlYWRhaGVhZAoKSW1wbGVtZW50IHJlYWRhaGVhZCBjYWxsYmFjayBm
b3Igc3F1YXNoZnMuIEl0IHdpbGwgcmVhZCBkYXRhYmxvY2tzCndoaWNoIGNvdmVyIHBhZ2VzIGlu
IHJlYWRhaGVhZCByZXF1ZXN0LiBGb3IgYSBmZXcgY2FzZXMgaXQgd2lsbApub3QgbWFyayBwYWdl
IGFzIHVwdG9kYXRlLCBpbmNsdWRpbmc6Ci0gZmlsZSBlbmQgaXMgMC4KLSBjdXJyZW50IGJhdGNo
IG9mIHBhZ2VzIGlzbid0IGluIHRoZSBzYW1lIGRhdGFibG9jayBvciBub3QgZW5vdWdoIGluIGEK
ICBkYXRhYmxvY2suCk90aGVyd2lzZSBwYWdlcyB3aWxsIGJlIG1hcmtlZCBhcyB1cHRvZGF0ZS4g
VGhlIHVuaGFuZGxlZCBwYWdlcyB3aWxsIGJlCnVwZGF0ZWQgYnkgcmVhZHBhZ2UgbGF0ZXIuCgpT
aWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Ci0tLQogZnMv
c3F1YXNoZnMvZmlsZS5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9mcy9zcXVhc2hmcy9maWxlLmMgYi9mcy9zcXVhc2hmcy9maWxlLmMK
aW5kZXggODlkNDkyOTE2ZGVhLi4yMGVjNDhjZjk3YzUgMTAwNjQ0Ci0tLSBhL2ZzL3NxdWFzaGZz
L2ZpbGUuYworKysgYi9mcy9zcXVhc2hmcy9maWxlLmMKQEAgLTM5LDYgKzM5LDcgQEAKICNpbmNs
dWRlICJzcXVhc2hmc19mc19zYi5oIgogI2luY2x1ZGUgInNxdWFzaGZzX2ZzX2kuaCIKICNpbmNs
dWRlICJzcXVhc2hmcy5oIgorI2luY2x1ZGUgInBhZ2VfYWN0b3IuaCIKIAogLyoKICAqIExvY2F0
ZSBjYWNoZSBzbG90IGluIHJhbmdlIFtvZmZzZXQsIGluZGV4XSBmb3Igc3BlY2lmaWVkIGlub2Rl
LiAgSWYKQEAgLTQ5NCw3ICs0OTUsNzYgQEAgc3RhdGljIGludCBzcXVhc2hmc19yZWFkcGFnZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBhZ2UgKnBhZ2UpCiAJcmV0dXJuIDA7CiB9CiAKK3N0
YXRpYyB2b2lkIHNxdWFzaGZzX3JlYWRhaGVhZChzdHJ1Y3QgcmVhZGFoZWFkX2NvbnRyb2wgKnJh
Y3RsKQoreworCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSByYWN0bC0+bWFwcGluZy0+aG9zdDsKKwlz
dHJ1Y3Qgc3F1YXNoZnNfc2JfaW5mbyAqbXNibGsgPSBpbm9kZS0+aV9zYi0+c19mc19pbmZvOwor
CXNpemVfdCBtYXNrID0gKDFVTCA8PCBtc2Jsay0+YmxvY2tfbG9nKSAtIDE7CisJc2l6ZV90IHNo
aWZ0ID0gbXNibGstPmJsb2NrX2xvZyAtIFBBR0VfU0hJRlQ7CisJbG9mZl90IHJlcV9lbmQgPSBy
ZWFkYWhlYWRfcG9zKHJhY3RsKSArIHJlYWRhaGVhZF9sZW5ndGgocmFjdGwpOworCWxvZmZfdCBz
dGFydCA9IHJlYWRhaGVhZF9wb3MocmFjdGwpICZ+IG1hc2s7CisJc2l6ZV90IGxlbiA9IHJlYWRh
aGVhZF9sZW5ndGgocmFjdGwpICsgcmVhZGFoZWFkX3BvcyhyYWN0bCkgLSBzdGFydDsKKwlzdHJ1
Y3Qgc3F1YXNoZnNfcGFnZV9hY3RvciAqYWN0b3I7CisJdW5zaWduZWQgaW50IG5yX3BhZ2VzID0g
MDsKKwlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXU2NCBibG9jayA9IDA7CisJaW50IGJzaXplLCBy
ZXMsIGksIGluZGV4OworCWludCBmaWxlX2VuZCA9IGlfc2l6ZV9yZWFkKGlub2RlKSA+PiBtc2Js
ay0+YmxvY2tfbG9nOworCWludCBtYXhfcGFnZXMgPSAxVUwgPDwgc2hpZnQ7CisKKwlyZWFkYWhl
YWRfZXhwYW5kKHJhY3RsLCBzdGFydCwgKGxlbiB8IG1hc2spICsgMSk7CisKKwlpZiAocmVhZGFo
ZWFkX3BvcyhyYWN0bCkgKyByZWFkYWhlYWRfbGVuZ3RoKHJhY3RsKSA8IHJlcV9lbmQpCisJCXJl
dHVybjsKKworCW5yX3BhZ2VzID0gcmVhZGFoZWFkX2NvdW50KHJhY3RsKTsKKwlwYWdlcyA9IGtt
YWxsb2NfYXJyYXkobnJfcGFnZXMsIHNpemVvZih2b2lkICopLCBHRlBfS0VSTkVMKTsKKwlpZiAo
IXBhZ2VzKQorCQlyZXR1cm47CisKKwlhY3RvciA9IHNxdWFzaGZzX3BhZ2VfYWN0b3JfaW5pdF9z
cGVjaWFsKHBhZ2VzLCBucl9wYWdlcywgMCk7CisJaWYgKCFhY3RvcikKKwkJZ290byBvdXQ7CisK
Kwlmb3IgKDs7KSB7CisJCW5yX3BhZ2VzID0gX19yZWFkYWhlYWRfYmF0Y2gocmFjdGwsIHBhZ2Vz
LCBtYXhfcGFnZXMpOworCQlpZiAoIW5yX3BhZ2VzKQorCQkJYnJlYWs7CisKKwkJaWYgKHJlYWRh
aGVhZF9wb3MocmFjdGwpID49IGlfc2l6ZV9yZWFkKGlub2RlKSB8fAorCQkgICAgZmlsZV9lbmQg
PT0gMCB8fCBucl9wYWdlcyA8IG1heF9wYWdlcykKKwkJCWdvdG8gc2tpcF9wYWdlczsKKworCQlp
bmRleCA9IHBhZ2VzWzBdLT5pbmRleCA+PiBzaGlmdDsKKwkJYnNpemUgPSByZWFkX2Jsb2NrbGlz
dChpbm9kZSwgaW5kZXgsICZibG9jayk7CisJCXJlcyA9IHNxdWFzaGZzX3JlYWRfZGF0YShpbm9k
ZS0+aV9zYiwgYmxvY2ssIGJzaXplLCBOVUxMLAorCQkJCQkgYWN0b3IpOworCisJCWlmIChyZXMg
Pj0wICYmIChwYWdlc1tucl9wYWdlcyAtIDFdLT5pbmRleCA+PiBzaGlmdCkgPT0gaW5kZXgpCisJ
CQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykKKwkJCQlTZXRQYWdlVXB0b2RhdGUocGFn
ZXNbaV0pOworCisJCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7CisJCQl1bmxvY2tf
cGFnZShwYWdlc1tpXSk7CisJCQlwdXRfcGFnZShwYWdlc1tpXSk7CisJCX0KKwl9CisKKwlrZnJl
ZShhY3Rvcik7CisJcmV0dXJuOworCitza2lwX3BhZ2VzOgorCWZvciAoaSA9IDA7IGkgPCBucl9w
YWdlczsgaSsrKSB7CisJCXVubG9ja19wYWdlKHBhZ2VzW2ldKTsKKwkJcHV0X3BhZ2UocGFnZXNb
aV0pOworCX0KKworCWtmcmVlKGFjdG9yKTsKK291dDoKKwlrZnJlZShwYWdlcyk7Cit9CiAKIGNv
bnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgc3F1YXNoZnNfYW9wcyA9IHsKLQku
cmVhZHBhZ2UgPSBzcXVhc2hmc19yZWFkcGFnZQorCS5yZWFkcGFnZSA9IHNxdWFzaGZzX3JlYWRw
YWdlLAorCS5yZWFkYWhlYWQgPSBzcXVhc2hmc19yZWFkYWhlYWQKIH07Ci0tIAoyLjMxLjAKCg==
--00000000000028ce5805de8eea57
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--00000000000028ce5805de8eea57
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--00000000000028ce5805de8eea57--

