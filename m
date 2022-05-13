Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F55274C7
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001IZ-Pn; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sxwjean@gmail.com>) id 1npeTF-0005Qi-SX
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ed+m13mmsGPsehFvKSi9eEmy3edAo/yW4BAPYfUU/Bw=; b=BIQy9GtFS45ysdzCYY0pp+Q/eb
 Y6RI2FHnbiFrB8qkr/o91Y9H5ht+7ESAVDOkCyRPZPI0m34GszDWA7/mMv292hDyepekT7PVg7ict
 FUsAgk05x+YyRlxyxghI2KQvE2j/hKo1V2tQ/F9EL1i3IdXnUwFKJwjBQS+MBSWVGbVQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ed+m13mmsGPsehFvKSi9eEmy3edAo/yW4BAPYfUU/Bw=; b=eGNqzg54CBG1m9CowbX+JYl0s9
 BKXN3lEtjY5e+uKGWx5TuvfVFGMHS2Y8En70Sq6AIwBacvfsOQ7RGCaTmJ7yUr719EZGznDLYRMWt
 Bp+Ki5lmmuAXfcfQipkIgLcgSFO+an+6KWPf4544clMSsCL7tZ/O4tDkz9wA/47Ctu64=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npeT9-0004oL-C4
 for squashfs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:13:15 +0000
Received: by mail-pj1-f45.google.com with SMTP id x88so9325179pjj.1
 for <squashfs-devel@lists.sourceforge.net>;
 Fri, 13 May 2022 16:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ed+m13mmsGPsehFvKSi9eEmy3edAo/yW4BAPYfUU/Bw=;
 b=MSGeukp1lvEESCHek8ZuvAYf73Zgo988LXQF7U/nFjiZtSXi8vHDet3AIfSpzf8UWz
 jIdnVH8kn4eIAZ50vhbid3G3TOCfiIhofL3yw7GFwgy8nsDlSBhMwd2G8MTnczLIc4/E
 9xnb/ORerw4M2DionXC9kX8ArMjOlItMpKv8eg2tPvb0JvXni6OPVknKet1BKe6LjjYD
 5TUEZxL2bduSuALbHJj3asOVU1QON5BtU3/JiU8MAEFOVpgxEATDuVzqKnBlDOWEWDb5
 iUEzR5s4/OVqe7Ke/kPz0AsXnKOrcoTLbiSVfb1a5lCAa/o2sw8udU5iazvpkhhAh2f2
 NzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ed+m13mmsGPsehFvKSi9eEmy3edAo/yW4BAPYfUU/Bw=;
 b=g/s2CVu70Fa+wGovDz2ZbHEKxK3zzYaQHo9KMN/XOl4aW4lwGaWIHXJ0BhjEZFUfbb
 P/iiMDL7qkq8aDUriT0NZJ2e7FcQghQfxbgHA1x1KgB/Rku9qevZxwEkDb2M7pRr13Q/
 2vZsYmE9jZA3UynQYPDJ8MMUv6Oo7kBuq/Tee4qq9OaNwlPN2Gf74iczpoeq175A0dp3
 n+asgkz/9JYc+4FNtcMub5mMivavzv6YPhmlIzwqtvygyxGLDObePAKgm8g5tumGfPu4
 jDxY9wDzHWgd/nO8mc7ctWo77wJ+RSUXUCUguF4quR90+qxGivFxnPrSk/V41SmQ0ryj
 sCqw==
X-Gm-Message-State: AOAM531pB5WhH9OSQm8Ybm8447hC6RDKOJ89RtDIy7QVUDvsBNXwjDhm
 4qFViRYey0te4IWlATb6SDsAVtQrdV/JOfkOnS4=
X-Google-Smtp-Source: ABdhPJxrixcaQXSQjby92wPBlcWMh6yYWzkJzx1O9h2VHjkA8F/NsmRPt9UjL5nHkx+SJXzIF7hryG/Zq6EJIH8L2QM=
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9375 with SMTP id
 u10-20020a170903124a00b00154c7a49375mr6939477plh.0.1652483585509; Fri, 13 May
 2022 16:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <CAEVVKH-VyKsFwOrY2kc7JPWtOB=usXtdia6tgcBwJCkcWPFx7g@mail.gmail.com>
 <CAJMQK-jx1_Zibxa48RSSKsFdt5kfoS22Csm5a_9sqTqGXOuCuA@mail.gmail.com>
 <Yn6fjVg6mzVJBNt0@casper.infradead.org>
In-Reply-To: <Yn6fjVg6mzVJBNt0@casper.infradead.org>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Sat, 14 May 2022 07:12:39 +0800
Message-ID: <CAEVVKH_a4DjV95AaS4xe_m4EFHMX3pMXrTThCE-h0TYEreeefg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 14, 2022 at 2:12 AM Matthew Wilcox wrote: > >
 On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote: > > > One stupid
 question, see below code from your patch: > > > > > > + } > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sxwjean[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1npeT9-0004oL-C4
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
 Zhang Yi <yi.zhang@huawei.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Sat, May 14, 2022 at 2:12 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote:
> > > One stupid question, see below code from your patch:
> > >
> > >  +       }
> > >  +
> > >  +       kfree(actor);
> > >  +       return;
> > >  +
> > >  +skip_pages:
> > >
> > > when release page pointers array after pages cached? I don't see
> > > any chance to do that.
> > >
> > actor is not a page pointer. This is allocated from
> > squashfs_page_actor_init() and should be freed after use. Or do you
> > mean skip_pages? There are some situations where we can't decompress
> > the whole block, so we will skip those pages.
>
> I think the concern is that you don't seem to kfree(pages) on this
> exit path.

That's exactly what I wanted to say. Thanks Matthew.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
