Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D85274C6
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001IB-GK; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1npOtz-0008FQ-4O
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 06:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VhFUDd1DqlQKUTmhLS6hQUgklWrN9WXEYPO4jAOfCwE=; b=QDf3MjPZWgX9KteZnkf9OtG4dC
 XsXeyIDHlqurx8UoEox2q0psdwOzrB+CUrvAiMKqw9KzsyKYG1k2dVvhEBIPNdGb0S7NNLA3YR0ay
 3PL/o2h0sYkoSHQb0BQujT2dwpcWNRBQQ8fuWbZM5BTVLiqdpPytOI8Q7PPglhi8oSRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VhFUDd1DqlQKUTmhLS6hQUgklWrN9WXEYPO4jAOfCwE=; b=ZkagRLUQ9Yn7YUrXw42NGQIXtC
 ZpRSC0suxs4eiyQehEXBt2+Vh4zr9ppb+ABtlnN5DI51oLp3qOKUy6vIKmTDclGgiiZDQYgsMYCR5
 uOQCUSzAVxhjGm91p/h0mROZ+pgrlPhepoLtJZlzeU4f8JxtFa3l2UdhpBShtUcn6zSc=;
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npOtv-00AaiK-Hw
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 06:35:49 +0000
Received: by mail-vk1-f178.google.com with SMTP id b81so3760997vkf.1
 for <squashfs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 23:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VhFUDd1DqlQKUTmhLS6hQUgklWrN9WXEYPO4jAOfCwE=;
 b=IjFV6dj3r23Q9t0eTX7d7jmaSSDUJHBCOCcTHNz/G1ttzsSBI4pAcAl4TAIyax4rf7
 Io3oa5HC/M0N9yizqW5a8NebKkcQ3atJiakVB6wcQ5HE740iSheStuxZIApax5hGR6Hi
 u2aO+4TUlqtylJQAzTdVnxSsfo7rmrMdBNTL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VhFUDd1DqlQKUTmhLS6hQUgklWrN9WXEYPO4jAOfCwE=;
 b=0aFNp5QKR8LZNrsuDXmB/NfpHFa9t67hnndHBevmKhJzVpbrc/iKaUdbFS0i3BlRha
 eMfUBhBt8ipxqrOQqxSRY9o10BN/CtkWhllCoD2p5inZeuDVEgx7G3rIA+GHXDKxnw7M
 OB8IlZTDZRAhrvnafYBhANZNVgzgs/jem8tZUCoob2/o9vAmZ6erm5/HzMKIUVp+Qmrg
 oZsU7iMM/96XOV+FIWKdF0Qv03/Kfrz+59nkHAkoFGshHm21J5v1i2VsuZFIjgGglsam
 3f9OrP/7LOqOu7k1MHNJV4tQoZtY5UvWkf4oDZn8eCVXUkT1O+BbUCZkFmAGcpVp4iWK
 6Xyw==
X-Gm-Message-State: AOAM531Y8U4XfZH4Z/HAOSTLVGcoLuh2izy4O9yTIefb3XAB4fLdouWh
 HUKBlstudobDtGMWzagKVBbdzUY5/2gzn2ocIjjxSQ==
X-Google-Smtp-Source: ABdhPJxLZaeW4s2OqCBrEOyQPurUpHZigCAWnINSzL5ZnuAfYlhqug56+a8bFTxwlaM/l4AbjHUtVMbSq3npCJZ8Xys=
X-Received: by 2002:a05:6122:da8:b0:331:3b30:8b40 with SMTP id
 bc40-20020a0561220da800b003313b308b40mr1686055vkb.30.1652423741507; Thu, 12
 May 2022 23:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
In-Reply-To: <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 13 May 2022 14:35:14 +0800
Message-ID: <CAJMQK-gHZ_SEykcB7Ux6ccJ68NK=MrXpP=yXv6CLFc9knriAeQ@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13,
 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > On 12/05/2022 07:23, Hsin-Yi Wang wrote: > > > > > Hi Matthew,
 > > Thanks for reviewing the patch previously. Does [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npOtv-00AaiK-Hw
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
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
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote:
>
> On 12/05/2022 07:23, Hsin-Yi Wang wrote:
>
> >
> > Hi Matthew,
> > Thanks for reviewing the patch previously. Does this version look good
> > to you? If so, I can send it to the list.
> >
> >
> > Thanks for all of your help.
>
> Hi Hsin-Yi Wang,
>
Hi Philip,

> Thanks for updating the patch to minimise the pages used when
> creating the page actor.
>
> Looking at the new patch, I have a couple of questions which is worth
> clarifying to have a fuller understanding of the readahead behaviour.
> In otherwords I'm deducing the behaviour of the readahead calls
> from context, and I want to make sure they're doing what I think
> they're doing.
>
> +       nr_pages = min(readahead_count(ractl), max_pages);
>
> As I understand it, this will always produce nr_pages which will
> cover the entirety of the block to be decompressed?  That is if
> a block is block_size, it will return the number of pages necessary
> to decompress the entire block?  It will never return less than the
> necessary pages, i.e. if the block_size was 128K, it will never
> return less than 32 pages?
>
In most of the cases the size is max_pages (readahead_count(ractl) ==
max_pages).

> Similarly, if at the end of the file, where the last block may not
> be a full block (i.e. less than block_size) it will only return
> the pages covered by the tail end block, not a full block.  For
> example, if the last block is 16 Kbytes (and block_size is
> 128 Kbytes), it will return 4 pages and not 32 pages ...
>

But it's possible that readahead_count(ractl) < max_pages at the end of file.

> Obviously this behaviour is important for decompression, because
> you must always have enough pages to decompress the entire block
> into.
>
> You also shouldn't pass in more pages than expected (i.e. if the
> block is only expected to decompress to 4 pages, that's what you
> pass, rather than the full block size).  This helps to trap
> corrupted blocks, where they are prevented to decompress to larger
> than expected.
>
> + nr_pages = __readahead_batch(ractl, pages, max_pages)
>
> My understanding is that this call will fully populate the
> pages array with page references without any holes.  That
> is none of the pages array entries will be NULL, meaning
> there isn't a page for that entry.  In other words, if the
> pages array has 32 pages, each of the 32 entries will
> reference a page.
>
I noticed that if nr_pages < max_pages, calling read_blocklist() will
have SQUASHFS errors,

SQUASHFS error: Failed to read block 0x125ef7d: -5
SQUASHFS error: zlib decompression failed, data probably corrupt

so I did a check if nr_pages < max_pages before squashfs_read_data(),
just skip the remaining pages and let them be handled by readpage.

> This is important for the decompression code, because it
> expects each pages array entry to reference a page, which
> can be kmapped to an address.  If an entry in the pages
> array is NULL, this will break.
>
> If the pages array can have holes (NULL pointers), I have
> written an update patch which allows the decompression code
> to handle these NULL pointers.
>
> If the pages array can have NULL pointers, I can send you
> the patch which will deal with this.

Sure, if there are better ways to deal with this.

Thanks.

>
> Thanks
>
> Phillip
>
>
>
> >
> >>>
> >>> It's also noticed that when the crash happened, nr_pages obtained by
> >>> readahead_count() is 512.
> >>> nr_pages = readahead_count(ractl); // this line
> >>>
> >>> 2) Normal cases that won't crash:
> >>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
> >>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
> >>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
> >>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
> >>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
> >>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
> >>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
> >>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
> >>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
> >>>
> >>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
> >>> Other values (max_pages, bsize, block...) looks normal
> >>>
> >>> I'm not sure why the crash happened, but I tried to modify the mask
> >>> for a bit. After modifying the mask value to below, the crash is gone
> >>> (nr_pages are <=256).
> >>> Based on my testing on a 300K pack file, there's no performance change.
> >>>
> >>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> >>> index 20ec48cf97c5..f6d9b6f88ed9 100644
> >>> --- a/fs/squashfs/file.c
> >>> +++ b/fs/squashfs/file.c
> >>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
> >>> readahead_control *ractl)
> >>>    {
> >>>           struct inode *inode = ractl->mapping->host;
> >>>           struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
> >>> -       size_t mask = (1UL << msblk->block_log) - 1;
> >>>           size_t shift = msblk->block_log - PAGE_SHIFT;
> >>> +       size_t mask = (1UL << shift) - 1;
> >>>
> >>>
> >>> Any pointers are appreciated. Thanks!
> >>
>


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
